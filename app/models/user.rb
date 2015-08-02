require 'digest/sha1'


class User < ActiveRecord::Base
    HASH_SALT = 'pepper'

    attr_accessor :new_password

    # TODO email regex? http://stackoverflow.com/q/6325846
    validates :new_password, :presence => true,
        :length => {:maximum => 20, :minimum => 6},
        :confirmation => true

    before_save :before_save

    def self.digest_from_password(plaintext_password)
        return Digest::SHA1.hexdigest(plaintext_password + HASH_SALT)
    end

    private
        def before_save
            self.password_digest = User.digest_from_password(@new_password)
        end
end
