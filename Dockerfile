FROM ruby:2.5.5-stretch

RUN apt-get update && apt-get install -y libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install yarn

RUN mkdir /var/www -p
WORKDIR   /var/www

COPY Gemfile /var/www/Gemfile
COPY Gemfile.lock /var/www/Gemfile.lock	

RUN gem install bundler && bundle install

COPY . .
