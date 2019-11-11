# README

### 1. 로그인 되어있으면 로그아웃 보여주고, 로그인 안되어있으면 로그인 보여주기
```
<% if user_signed_in? %>
    현재 로그인된 유저의 이메일 : <%= current_user.email %>
    <%= link_to "로그아웃", destroy_user_session_path, method: :delete, data: { confirm: "Are you sure?" } %>
<% else %>
    <%= link_to "로그인", new_user_session_path %>
<% end %>
```

### 2. [app/controllers/users/omniauth_callbacks_controller.rb](https://github.com/likelionwork1/devise-snslogin/blob/master/app/controllers/users/omniauth_callbacks_controller.rb)

### 3. [app/models/user.rb](https://github.com/likelionwork1/devise-snslogin/blob/master/app/models/user.rb)
