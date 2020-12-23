package com.example.controller;

import com.example.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("news")
public class NewsController {
    @Resource
    private NewsService newsServiceImpl;
}
