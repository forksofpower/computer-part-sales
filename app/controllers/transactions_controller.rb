class TransactionsController < ApplicationController
    before_action :find_transaction, except: [:index, :new, :create]

    def index
        @transactions = Transaction.all
    end

    def show
    end

    def new
        @transaction = Transaction.new
    end

    def edit
    end

    def create
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
        #   flash[:success] = "Transaction successfully created"
          redirect_to @transaction
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def update
        if @transaction.update_attributes(transaction_params)
        #   flash[:success] = "Transaction was successfully updated"
          redirect_to @transaction
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        if @transaction.destroy
            # flash[:success] = "Transaction was successfully deleted"
            redirect_to @transactions_path
        else
            flash[:error] = "Something went wrong"
            redirect_to @transactions_path
        end
    end

    private

        def transaction_params
            params.require(:transaction).permit()
        end

        def find_transaction
            @transaction = Transaction.find(params[:id])
        end

end
