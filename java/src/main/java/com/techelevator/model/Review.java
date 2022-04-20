package com.techelevator.model;

public class Review {
    private String username= "";
    private String content = "";
    private boolean thumbs_Up = false;


    // getters  and setters

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isThumbs_Up() {
        return thumbs_Up;
    }

    public void setThumbs_Up(boolean thumbs_Up) {
        this.thumbs_Up = thumbs_Up;
    }
}
