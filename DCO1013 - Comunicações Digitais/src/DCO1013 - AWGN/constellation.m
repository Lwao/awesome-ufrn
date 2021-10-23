function constellation(varargin)
in = varargin{1};
X = real(in);
Y = imag(in);

% reference to axes variable
axes1 = gca;
hold(axes1,'on');

% create plot
plot(X,Y,'Marker','*','LineStyle','none');

if(nargin==1) % if 1 argument, set axis max. values by message
    max_axis = max(abs(X));
    if (max_axis<max(abs(Y))) max_axis = max(abs(Y)); end
    max_axis = 2*max_axis;
else % if not, set by 2nd argument
   max_axis = varargin{2}; 
end

% define axes limits
xlim(axes1,[-max_axis max_axis]);
ylim(axes1,[-max_axis max_axis]);

box(axes1,'on');

% Set the remaining axes properties
set(axes1,'XGrid','on','YGrid','on');
xlabel('In-phase amplitude');
ylabel('Quadrature amplitude');
