class UsersController < ApplicationController
  # GET /users
  # GET /users.xml

def index
      puts "HELOOOOOOOOOOOOO"
      puts params[:_search]
      users = []
      scope = User.scoped({})
      scope = scope.scoped :conditions => ["id = ?", params[:id]] if params[:id].present?
      scope = scope.scoped :conditions => ["firstname LIKE ?", "%#{params[:firstname]}%"] if params[:firstname].present?
      scope = scope.scoped :conditions => ["lastname LIKE ?", "%#{params[:lastname]}%"] if params[:lastname].present?
      scope = scope.scoped :conditions => ["email LIKE ?", "%#{params[:email]}%"] if params[:email].present?
      scope = scope.scoped :conditions => ["role LIKE ?", "%#{params[:role]}%"] if params[:role].present?
      
 #     scope.each{|u| users << u}

      users = scope.paginate :page => params[:page], :per_page => params[:rows]
      


  respond_to do |format|
    format.html
    format.json { render :json => users.to_jqgrid_json([:id,:pseudo,:firstname,:lastname,:email,:role], 
                                                       params[:page], params[:rows], 24) }
  end
end


  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
