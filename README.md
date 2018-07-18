# QuizMaster

QuizMaster is an application, can play and manage quizzes.

## System information

- Ruby
  - 2.5.1
- Rails
  - 5.2.0
- Database
  - PosgreSQL
- Development Environment Dependences
  - docker-compose

## Setup Development Environment

1. install docker

Please install docker to your computer.

ref: [Docker docs](https://docs.docker.com/install/)

2. clone git repository

Please git clone this repository.

3. setup docker

```
$ cd /path/to/repository
$ docker-compose build
# Building docker image. Please wait several minutes...
```

4. setup database

```
$ docker-compose run web bin/rails db:create
$ docker-compose run web bin/rails db:migrate
```

5. run application

```
$ docker-compose up
```

Open `http://localhost:3000` in your browser.

## Application Usage

### Manage Quiz

access `/questions` or clicked `Manage Question` navigation bar menu.

### Play Quiz

1. access `/quiz` or clicked `Quiz` navigation bar menu.
2. Quiz is displayed randomly.
3. Please input quiz answer, and click `submit` button.
4. Display `Correct` or `Incorrect`, and displayed next quiz.

