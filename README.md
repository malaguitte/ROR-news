# README

[ROR-news](https://github.com/malagutti/ROR-news)

## Install

### Clone the repository

```shell
$ git clone git@github.com:malagutti/ROR-news.git
$ cd ROR-news
```

### Check your Ruby version locally

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.3`

If not, please install Ruby in your machine, more info here: [ruby-lang.org - installation](https://www.ruby-lang.org/en/documentation/installation/)

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
$ bundle
$ yarn
```

### Initialize the database

```shell
$ rails db:create db:migrate db:seed
```

## Start the project locally

```shell
$ cd ROR-news
$ rails server
```