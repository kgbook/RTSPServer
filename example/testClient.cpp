#include <boost/asio/signal_set.hpp>
#include <boost/asio/io_service.hpp>
#include "idle_service.h"
#include "util.h"
#include "transcode_service.h"
#include "record_service.h"

int main(int argc, char **argv) {
    const std::string url = "your Rtsp stream URL Here";
    Log *log = Log::getInstance();
    TranscodeService *transcodeService = new TranscodeService();
    RecordService *recordService = new RecordService();
    IdleService *idleService = new IdleService();
    std::shared_ptr<StreamQueue> streamQueue = std::make_shared<StreamQueue>();
    boost::asio::io_service io_service;
    boost::asio::signal_set signals(io_service, SIGINT, SIGALRM);

    Util::enable_core_dump();

    log->init();

    transcodeService->setStreamQueue(streamQueue);
    transcodeService->init(url);
    auto param = transcodeService->getCodecParameter();

    recordService->setStreamQueue(streamQueue);
    recordService->init(param);

    idleService->init();

    signals.async_wait(
        [&io_service](const boost::system::error_code& /*error*/, int signal_number){
            switch (signal_number) {
                case SIGINT: {
                    io_service.stop();
                    break;
                };

                case SIGALRM: {
                    io_service.stop();
                    break;
                };

                default: {
                    break;
                }
            }
        });

    io_service.run();
    idleService->destroy();

    recordService->destory();
    delete(recordService);

    transcodeService->destory();
    delete(transcodeService);

    log->destroy();

    return 0;
}