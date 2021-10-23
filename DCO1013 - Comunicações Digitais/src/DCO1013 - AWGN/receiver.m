function msg = receiver(param,msg)
    m = size(msg.noisy,2);            % length of message
    n = size(msg.noisy,1);            % number of message versions with different EbN0
    filt = zeros(1,m);                % filtered message by the matched filter
    down = zeros(1,m/param.SPS);      % downsampled message
    msg.dedoc = zeros(n,m/param.SPS); % final decoded message
    threshold = 0;                    % decision threshold
    for i = 1:n
        filt = filter(param.shape_filter, 1, msg.noisy(i,:))/param.SPS; % receiver filter
        down = downsample(filt, param.SPS, param.SPS-1);                % downsample
        down = real(down);
        for j = 1:param.size % threshold decision device
            if(down(j)>threshold) msg.decod(i,j) = 1;     
            elseif(down(j)<-threshold) msg.decod(i,j) = -1;
            else msg.decod(i,j) = down(j); end
        end
    end
end

% function msg = receiver(param,msg)
%     rnd = floor(log10(param.Rs)); % round Tb for how many decimal places
%     threshold = 0;                 % arbitrary threshold of decision
%     m = size(msg.noisy,2);         % length of message
%     n = size(msg.noisy,1);         % number of message versions with different EbN0
%     acc = 0;
%     Tb = 0;
%     for i = 1:n
%         decod = [];
%         for j = 1:m
%             acc = acc + msg.noisy(i,j);
%             Tb = Tb + 1/param.Rs; 
%             msg.filt(i,j) = acc;
%             if(round(Tb,rnd)==round(1/param.Rb,rnd))
%                 decod = [decod real(msg.filt(i,j))];               
%                 acc = 0;
%                 Tb = 0;
%             end
%         end
%         
%         for k = 1:length(decod)
%             if(decod(k)>threshold) msg.decod(i,k) = 1;     
%             elseif(decod(k)<-threshold) msg.decod(i,k) = -1;
%             else msg.decod(i,k) = decod(k); end
%         end
%     end
% end