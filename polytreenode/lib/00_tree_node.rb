class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(daddy)
        if daddy && @parent # reassigning
            @parent.children.delete(self)
            daddy.children << self
        elsif daddy.nil? && @parent
            @parent.children.delete(self)
        elsif !daddy.children.include?(self)
            daddy.children << self
        end
        @parent = daddy
    end

    def add_child(child)
      child.parent=(self)
    end

    def remove_child(child)
      child.parent=(nil)
    end

    def inspect
      "Val: #{@value} | Parent: #{@parent ? @parent.value : 'none'} | Children: #{@children.map{|child| child.value}}"
    end
end

class Searchable

end