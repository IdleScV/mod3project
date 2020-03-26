class BattleDataController < ApplicationController
    def index
        data = BattleDatum.all

        render json: BattleDataSerializer.new(data)
    end

    def show
        data = BattleDatum.where(battle_id: params[:id])

        render json: BattleDataSerializer.new(data[0])
    end

    def create
        data = BattleDatum.new(userSolution: params[:userSolution], opponentSolution: params[:opponentSolution], battle_id: params[:battle_id])

        if data
            savedData = data.save
        end
        # byebug
        render json: savedData
    end

    def update
        data = BattleDatum.find(params[:id])
       
        if params[:userSolution]
            data.update(userSolution: params[:userSolution]  )
            render json: data
        elsif params[:opponentSolution]
            data.update(opponentSolution: params[:opponentSolution]  )
            render json: data
        elsif params[:userTime]
            data.update(userTime: params[:userTime])
        elsif params[:opponentTime]
            data.update(opponentTime: params[:opponentTime])
        end
        
    end
end
