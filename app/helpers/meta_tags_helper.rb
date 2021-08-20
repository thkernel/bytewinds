module MetaTagsHelper
    def meta_image
        metag_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    end
end