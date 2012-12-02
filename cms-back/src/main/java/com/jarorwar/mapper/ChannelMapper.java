package com.jarorwar.mapper;

import com.jarorwar.model.Channel;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: mimiloveququ
 * Date: 12-12-2
 * Time: 上午1:25
 * To change this template use File | Settings | File Templates.
 */
public interface ChannelMapper {
    int addChannel(Channel channel);

    int updateChannel(Channel channel);

    List<Channel> getAllChannelByStatus(Byte status);

    int deleteChannelById(String id);

}
