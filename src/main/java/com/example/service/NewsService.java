package com.example.service;

import com.example.pojo.News;

import java.util.List;

public interface NewsService {
    List<News> selectAllNews();
    News selectNewsById(int id);
    int updNews(String name, String img, int id);
}
