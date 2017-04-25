# docker-ruby
- ruby version 2.3.3
- git clonable
- java 8
- Android tools and platform-tools support
- Only support selenium remote driver

# Steps
- Put private key under root directory of repo (name should be repo-key)
    * KKStream member just call ./get_key.sh
- make
- cd test_proj_dir && docker run -i -t -v $(pwd):/root -w /root  ted/ruby /bin/bash -l -c './runTest.sh features/aa.feature' 

runTest.sh
```
#!/bin/bash
bundle update
bundle install
cucumber $1
```
