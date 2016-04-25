package com.xiaotao.feedback.service.impl;

import com.xiaotao.feedback.dao.FeedbackDao;
import com.xiaotao.feedback.model.Feedback;
import com.xiaotao.feedback.service.FeedbackService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ━━━━━━神兽出没━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 * <p/>
 * ━━━━━━感觉萌萌哒━━━━━━
 *
 * @author xiaoTao
 * @date 2016-04-25  14:07
 */

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackDao feedbackDao;

    @Override
    public int insert(Feedback feedback) {
        return feedbackDao.insert(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback() {
        return feedbackDao.getAllFeedback();
    }

    @Override
    public Feedback findOptionById(@Param("id") int id) {
        return feedbackDao.findOptionById(id);
    }

    @Override
    public void deleteByID(@Param("id") int id) {
        feedbackDao.deleteByID(id);
    }
}
