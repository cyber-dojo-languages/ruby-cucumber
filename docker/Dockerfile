FROM  cyberdojofoundation/ruby:2.3.1
LABEL maintainer=jon@jaggersoft.com

RUN gem install --no-rdoc --no-ri rspec
RUN gem install --no-rdoc --no-ri shoulda
RUN gem install --no-rdoc --no-ri cucumber

COPY red_amber_green.rb /usr/local/bin
