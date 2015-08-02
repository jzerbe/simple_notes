class Note < ActiveRecord::Base
    belongs_to :user

    before_save :before_save
    before_destroy :before_destroy
    # http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
    # better to do this in the controller? hooks are here ...

    private
        def before_destroy
            #TODO enforce ownership before delete
        end

        def before_save
            #TODO enforce ownership before update
        end
end
