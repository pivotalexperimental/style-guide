require "hogan_assets"

module HoganAssets
  class Hogan
    def self.compile(source, options = {})
      context.eval("Hogan.compile(#{source.inspect}, {asString: true, sectionTags: [{o: '_i', c: 'i'}]})")
    end
  end
end
