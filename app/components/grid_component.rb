class GridComponent < ViewComponent::Base
  TYPES = { responsive: 'responsive-grid', fixed: 'grid' }.freeze

  def initialize(type: :responsive, column_gap: nil, row_gap: nil, columns: nil, rows: nil)
    super
    @column_gap = column_gap
    @row_gap = row_gap
    @columns = columns
    @rows = rows
    @type = type
  end

  def columns_css
    return unless @columns

    '1fr ' * @columns.to_i
  end

  def rows_css
    return unless @rows

    'auto ' * @rows.to_i
  end

  def column_gap
    return '1rem' if @column_gap.blank?

    "#{@column_gap}px"
  end

  def row_gap
    return '1rem' if @row_gap.blank?

    "#{@row_gap}px"
  end

  def class_name
    TYPES[@type]
  end
end
