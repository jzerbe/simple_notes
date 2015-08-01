require 'digest/sha1'


class User < ActiveRecord::Base
    HASH_SALT = 'pepper'

    def self.digest_from_password(password)
        return Digest::SHA1.hexdigest(password + User::HASH_SALT)
    end
end
