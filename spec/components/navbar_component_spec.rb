require 'rails_helper'

RSpec.describe NavbarComponent, type: :component do
    it "renders nav bar" do
      rendered_component = described_class.new(current_user: nil)

      expect(rendered_component).to have_content('Jobs')
      expect(rendered_component).to have_link("Empresas cadastradas", href: '/companies')
      expect(rendered_component).to have_link("Vagas Recentes", href: '/job_opportunities')
    end
end
