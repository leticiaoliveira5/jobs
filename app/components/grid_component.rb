class GridComponent < ViewComponent::Base
  def initialize(params = {})
    super
    @column_gap = params[:column_gap]
    @row_gap = params[:row_gap]
    @columns = params[:columns]
    @rows = params[:rows]
  end

  def columns_css
    return unless @columns

    '1fr ' * @columns.to_i
  end

  def rows_css
    return unless @rows

    'auto ' * @rows.to_i
  end
end
