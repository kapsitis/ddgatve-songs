import qrcode
import qrcode.image.svg

def main_png(): 
    # Data to encode
    data = dict() 
    data['BraucJa-ni-tiNuNoRi-gas'] = 'http://youtu.be/dT65c94fFE8'
    data['EsTevLu-dzuJa-n-aTe-vs'] = 'https://youtu.be/D2y6NgJ46FY'
    data['SenDzirdejuNuIeraugu'] = 'https://youtu.be/ebSFv8zThyA'
    data['TumsaTumsaKasParTumsu'] = 'https://www.vilki.lv/Vilkudiski/MansBeritsKumelins/timsins-goja-timsins-goja.html'
    data['SauleBraucaPa-rDebesi'] = 'https://youtu.be/FJye77CdrOw'
    data['JauJa-ni-tisAizvakar'] = 'https://www.vilki.lv/Vilkudiski/MansBeritsKumelins/jau-janitis-aizvakar.html'
    data['Ja-n-aMa-tesPagalma-i'] = 'https://youtu.be/-45BGpYV1Fs'
    
 
    for key in data:
        # Creating an instance of QRCode class
        qr = qrcode.QRCode(version = 1,
                   box_size = 10,
                   border = 1)
     
        # Adding data to the instance 'qr'
        qr.add_data(data[key])
 
        qr.make(fit = True)
        img = qr.make_image(fill_color = 'black',
                    back_color = 'white')
 
        img.save('../../../songs/qr_png/' + key + '.png')



def main_svg(): 
    # Data to encode
    data = dict() 
    data['BraucJa-ni-tiNuNoRi-gas'] = 'http://youtu.be/dT65c94fFE8'
    data['EsTevLu-dzuJa-n-aTe-vs'] = 'https://youtu.be/D2y6NgJ46FY'
    data['SenDzirdejuNuIeraugu'] = 'https://youtu.be/ebSFv8zThyA'
    data['TumsaTumsaKasParTumsu'] = 'https://www.vilki.lv/Vilkudiski/MansBeritsKumelins/timsins-goja-timsins-goja.html'
    data['SauleBraucaPa-rDebesi'] = 'https://youtu.be/FJye77CdrOw'
    data['JauJa-ni-tisAizvakar'] = 'https://www.vilki.lv/Vilkudiski/MansBeritsKumelins/jau-janitis-aizvakar.html'
    data['Ja-n-aMa-tesPagalma-i'] = 'https://youtu.be/-45BGpYV1Fs'
    
 
    for key in data:
        method = "basic"

        

        if method == 'basic':
            factory = qrcode.image.svg.SvgImage
        elif method == 'fragment':
            factory = qrcode.image.svg.SvgFragmentImage
        elif method == 'path':
            factory = qrcode.image.svg.SvgPathImage


        img = qrcode.make(data[key], image_factory = factory)

        # Save svg file somewhere
        img.save('../../../songs/qr_svg/' + key + '.svg')







if __name__ == '__main__':
    main_svg()