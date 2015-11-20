# name: HummingBird One-Box
# about: Simple User Profile display box for Discourse
# version: 0.1
# authors: Vikhyat Korrapati (code by)
# url: https://github.com/vikhyat/discourse-hummingbird (source)

register_asset "style.css"

Onebox = Onebox

module Onebox
  module Engine
    class HummingbirdOnebox
      include Engine
      include JSON

      matches_regexp /https?:\/\/hummingbird\.me\/anime\/.+/

      def url
        slug = @url.match(/https?:\/\/hummingbird\.me\/anime\/(.+)/)[1]
        "https://hummingbird.me/api/v1/anime/#{slug}"
      end

      def to_html
        anime = raw
        "
        <div class='onebox-result'>
          <div class='source'>
            <div class='info'>
              <a href='#{@url}' class='track-link' target='_blank'>
                Anime (#{anime["show_type"]})
              </a>
            </div>
          </div>
          <div class='onebox-result-body'>
            <img src='#{anime["cover_image"]}' class='thumbnail'>
            <h3><a href='#{@url}' target='_blank'>#{anime["title"]}</a></h3>
            <h4>#{anime["genres"].map {|x| x["name"] } * ", "}</h4>
            #{anime["synopsis"]}
          </div>
          <div class='clearfix'></div>
        </div>
        "
      end
    end
  end
end
