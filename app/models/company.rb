class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    #Class method
    def self.oldest_company
        self.all.min_by {|company| company.founding_year}
    end

    #Instance method
    def give_freebie(dev, item_name, value)
        Freebie.create(
            item_name: item_name,
            value: value,
            company_id: self.id,
            dev_id: dev.id
        )
    end

end
