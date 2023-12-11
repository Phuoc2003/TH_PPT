classdef TichPhan < handle

    properties (Access = private)
        a; 
        b;
        fx; 
        integralMethod;
        N;
        result;
    end

    properties (Constant)
        PP_HINH_THANG = 0;
        PP_SIMPSON = 1;
        PP_CHINH_XAC = 2;
    end

    methods
        function obj = TichPhan(a, b, N, fx, integralMethod)
            obj.a = a;
            obj.b = b;
            obj.N = N;
            obj.fx = fx;
            obj.integralMethod = integralMethod;
        end

        function setA(obj, a)
            obj.a = a;
        end

        function a = getA(obj)
            a = obj.a;
        end

        function setB(obj, b)
            obj.b = b;
        end

        function b = getB(obj)
            b = obj.b;
        end

        function setFx(obj, fx)
            obj.fx = fx;
        end

        function fx = getFx(obj)
            fx = obj.fx;
        end

        function setIntegralMethod(obj, method)
            obj.integralMethod = method;
        end

        function method = getIntegralMethod(obj)
            method = obj.integralMethod;
        end

        function setN(obj, N)
            obj.N = N;
        end

        function result = getResult(obj)
            result = obj.result;
        end

        function result = tichPhanHinhThang(obj)
            h = (obj.b - obj.a)/obj.N;
            sum = 0;
            for i = 1:obj.N-1
                sum = sum + obj.fx(obj.a + i*h);
            end
            obj.result = (h/2)*(obj.fx(obj.a) + obj.fx(obj.b) + 2*sum);
            result = obj.result;
        end

        function result = tichPhanSimpson(obj) 
            h = (obj.b - obj.a)/obj.N;
            oddSum = 0; %sum le
            evenSum = 0; %sum chan
            for i = 1:obj.N-1
                if mod(i,2) == 0
                    evenSum = evenSum + obj.fx(obj.a + i*h);
                elseif mod(i,2) == 1
                    oddSum = oddSum + obj.fx(obj.a + i*h);
                end
            end
            obj.result = (h/3)*(obj.fx(obj.a) + obj.fx(obj.b) + 4*oddSum + 2*evenSum);
            result = obj.result;
        end

        function result = tichPhanChinhXac(obj)
            obj.result = integral(obj.fx, obj.a, obj.b);
            result = obj.result;
        end
    end
end