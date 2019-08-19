module MicropostsHelper

    def active_status(status)
        if status
            status = "Активная"
        else
            status = "Неактивная"
        end
        return status
    end

    def content_ad(content)
       return truncate(content, :length => 160)
    end

    def tag_cloud(tags, classes)
        max = tags.sort_by(&:count).last
           tags.each do |tag|
               index = tag.count.to_f / max.count * (classes.size-1)
               yield(tag, classes[index.round])
           end
    end
end
