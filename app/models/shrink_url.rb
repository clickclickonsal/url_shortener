class ShrinkUrl < ActiveRecord::Base
	CHARSET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  BASE = 62
  CODE_LENGTH = 6

	def self.shorten_url(url)
		id = (100..1989).to_a.sample / url.length 
    code = ""
    while (id > 0) do
      code = CHARSET[id % BASE].chr + code
      id = id / BASE
    end

    new_code = (code.length > CODE_LENGTH) ? "" : "0" * (CODE_LENGTH - code.length) + code
    return new_code.to_s
  end

end