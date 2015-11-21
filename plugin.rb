# name: hummingbird
# about: discourse customizations for hummingbird
# version: 0.1
# authors: Vikhyat Korrapati

plugins_dir = File.expand_path(File.dirname(__FILE__))

### Onebox
load File.expand_path('../onebox.rb', __FILE__)
