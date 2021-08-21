class Resolver < DataClass

    attr_accessor :name, :type, :resolution, :verb

    def initialize(name, type, resolution, verb = nil)
        @name = name
        @type = type
        @resolution = resolution
        @verb = verb
    end
    
    def order_result(action)
        if action.result.is_a?(Array) && action.result.count > 1
            action.result.uniq!
            order_uniq_result(action)
        end
    end

    def order_uniq_result(action)
        if action.result[0].is_a?(String)
            action.result = action.result.sort
        else
            order_result_by_player(action)
        end
    end

    def order_result_by_player(action)
        action.result = action.result.sort do |player1, player2|
            player1.rank <=> player2.rank
        end
    end

end