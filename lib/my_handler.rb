require 'tire'
module MyHandler
  def self.getmasinhvien(a, page, per)
	
	c = Tire.search 'students2', :search_type => 'count' do
	  query do			
			string "ma_sinh_vien:#{a} or hodem:#{a} or ten:#{a}"
		end
	end
    s = Tire.search 'students2' do
		query do			
			string "ma_sinh_vien:#{a} or hodem:#{a} or ten:#{a}"
		end
		page = (page || 1).to_i
		  search_size = per || DEFAULT_SIZE
		  from (page -1) * search_size
		  size search_size
	end
	return {:results => s.results, :total => c.results.total}.to_json
  end
  
  def self.getinfo(a,b, page, per)
    c = Tire.search 'students2', :search_type => 'count' do
	  query do			
			string "#{a}:#{b}"
		end
	end
    
	s = Tire.search 'students2' do
		query do			
			string "#{a}:#{b}"
		end
		page = (page || 1).to_i
		  search_size = per || DEFAULT_SIZE
		  from (page -1) * search_size
		  size search_size
	end
	return {:results => s.results, :total => c.results.total}.to_json
  end
  
  
end