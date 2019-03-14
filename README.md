# BCBackend

SITP 区块链二手市场项目后端源代码，使用 Ruby on Rails 框架。

## 版本

- Ruby 版本 2.3.5
- Rails 版本 5.2.1

## 如何运行

如果你没有安装过 Ruby，那请先安装对应版本的 Ruby，推荐使用 [rbenv](https://github.com/rbenv/rbenv)。然后请安装 Bundler（`gem install bundler`），在国内访问速度可能会出现问题，可以参考 [Ruby China 社区源](https://gems.ruby-china.com/)。

完成之后，在本项目的代码目录下运行 `bundle install`，如果命令成功结束，说明所有的依赖都已经安装好了。当然，系统上需要安装好 Sqlite3 这个数据库。

## 初始化数据库

运行 `rails db:migrate` 即可。

## 运行服务器

运行 `rails s`，默认端口在 3000，可以通过 `-p` 参数指定另一个端口。
