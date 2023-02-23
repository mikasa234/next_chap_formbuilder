FROM ruby:2.7.7
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . .
RUN bin/rails db:migrate
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
