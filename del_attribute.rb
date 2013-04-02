class DelAttribute < Chef::Knife
      deps do
        require 'chef/api_client'
        require 'chef'
        require 'chef/node'
      end

      banner "knife del_attribute [NODE] [ATTRIBUTE] recursive?"

      def run
        recursive = false
        if name_args.length != 2 and name_args.length != 3
          show_usage
          exit 1
        else
          if name_args.length == 3 and @name_args[2] == 'recursive'
             recursive = true
          end
          @nodename = @name_args[0]
          attribute_arg = @name_args[1]
        end
        @node = Chef::Node.load(@nodename)
        if recursive
          slices = attribute_arg.split('.')
          @node.normal.delete(slices[0])
        else
          slices = attribute_arg.split('.')
          last = slices.pop
          parts = slices
          hash = parts.inject(@node) { |h,attr| !h.has_key?(attr) ? (puts h.inspect;puts attr;h[attr]={};h[attr]) : h[attr]}

          hash.delete(last)
        end
        @node.save
      end

    end
