#ifndef PROJECT_STREAM_RECORD_H
#define PROJECT_STREAM_RECORD_H

extern "C" {
#include <libswscale/swscale.h>
}
#include "ffmpeg_utils.h"
#include "stream_queue.h"
#include "video_codec_parameter.h"

class StreamRecord : public FFmpegUtils {
public:
    StreamRecord(std::shared_ptr<VideoCodecParameter> param);

    virtual ~StreamRecord() = default;

    virtual bool openStream(std::string url);

    virtual bool closeStream(std::string url);

    virtual void writeVideoFrame(std::shared_ptr<AVPacket> packet);

private:

    bool codecInit();

    bool addStream();

    bool openVideoStream();

    AVCodecID getCodecID();

private:
    AVOutputFormat *oformat;

    AVFormatContext *ofmt_ctx;

    AVCodec *video_codec;

    AVCodecContext *out_video_codec_ctx;

    AVStream *out_video_stream;

    std::shared_ptr<VideoCodecParameter> param_;

    Log *log_;

    bool open_sucess;

    uint64_t frame_cnt;
};

#endif //PROJECT_STREAM_RECORD_H
