FROM ruby:2.7
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app
ADD Gemfile.lock /usr/src/app
ADD migratelint.gemspec /usr/src/app
ADD lib/migratelint/version.rb /usr/src/app/lib/migratelint/version.rb

RUN gem install bundler -v1.17.3 && bundle install --without development test

ADD . /usr/src/app
RUN ln -s /usr/src/app/exe/migratelint /usr/local/bin/migratelint
ENTRYPOINT ["exe/migratelint"]
CMD ["help"]
