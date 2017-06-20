# docker-ruby
- ruby version 2.3.3
- java 8
- Android tools and platform-tools support
- Only support selenium remote driver

# Usage
docker run -i -t -v $(pwd):/root -w /root  tedimaging/ruby /bin/bash -l -c 'bundle update && bundle install && cucumber features/XXX.feature' 
