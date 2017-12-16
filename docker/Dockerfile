FROM  cyberdojofoundation/ruby:2.4.3
LABEL maintainer=jon@jaggersoft.com

RUN gem install --no-rdoc --no-ri \
  rspec \
  shoulda \
  cucumber

COPY red_amber_green.rb /usr/local/bin
