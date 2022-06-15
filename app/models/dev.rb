class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.find_by(item_name: item_name).nil? ? false : true
    end

    def give_away(new_dev, freebie)
        #check if the Dev instance 'received_one?' of the 'freebie' (arg)
        #if true, then update freebie dev_id to new_dev.id

        if self.received_one?(freebie.item_name) 
            freebie.update(dev_id: new_dev.id)
        end
    end
end
