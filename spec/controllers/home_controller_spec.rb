require "rails_helper"

RSpec.describe HomeController do
  describe "GET #home" do
    subject { get :index }

    context "when there are available airports" do
      before { create_list(:airport, 6) }

      it { is_expected.to render_template(:index) }
      it { is_expected.to have_http_status(200) }
      it "displays list of available airports" do
        get :index
        expect(assigns[:airports]).not_to be_empty
      end
    end

    context "when there are no available airports" do
      it { is_expected.to render_template(:index) }
      it { is_expected.to have_http_status(200) }
      it "displays list of available airports" do
        get :index
        expect(assigns[:airports]).to be_empty
      end
    end
  end
end
