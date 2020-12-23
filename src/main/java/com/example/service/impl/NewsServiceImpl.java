package com.example.service.impl;

import com.example.mapper.NewsMapper;
import com.example.pojo.News;
import com.example.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Resource
    private NewsMapper newsMapper;

    @Override
    public List<News> selectAllNews() {
        return newsMapper.selectAllNews();
    }

    @Override
    public News selectNewsById(int id) {
        return newsMapper.selectNewsById(id);
    }

    @Override
    public int updNews(String name, String img, int id) {
        return newsMapper.updNews(name, img, id);
    }
}
