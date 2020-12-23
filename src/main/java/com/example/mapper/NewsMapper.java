package com.example.mapper;

import com.example.pojo.News;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface NewsMapper {
    @Select("select * from news")
    List<News> selectAllNews();

    News selectNewsById(int id);

    int updNews(String name, String img, int id);
}
