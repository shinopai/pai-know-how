FROM ruby:3.1

RUN mkdir /pai-know-how
WORKDIR /pai-know-how
COPY Gemfile /pai-know-how/Gemfile
COPY Gemfile.lock /pai-know-how/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /pai-know-how

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
