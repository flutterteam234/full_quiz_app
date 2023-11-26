bool isEmailValid(String? value) {
  if (value != null) {
    if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
      return true;
    }
    return false;
  } else {
    return false;
  }
}

bool isPasswordValid(String password) {
  // Parola en az 8 karakterden oluşmalıdır
  if (password.length < 8) {
    return false;
  }

  // Parolada en az bir büyük harf olmalıdır
  if (!password.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  // Parolada en az bir küçük harf olmalıdır
  if (!password.contains(RegExp(r'[a-z]'))) {
    return false;
  }
  // Yukarıdaki koşulların hepsini sağlıyorsa parola geçerlidir
  return true;
}

bool isNameValid(String name) {
  // İsim kontrolü (örneğin, boş olmamalı gibi)
  return name.isNotEmpty;
}

bool registerUser(String name, String email, String password) {
  if (isEmailValid(email) && isPasswordValid(password) && isNameValid(name)) {
    // Eğer e-posta, parola ve isim geçerliyse kayıt işlemini gerçekleştir
    // Burada kayıt işlemini yapacak kodu ekleyebilirsiniz
    print('Kullanıcı kaydedildi: $name, $email');
    return true; // Kayıt başarılı
  } else {
    print('Geçersiz giriş bilgileri.');
    return false; // Kayıt başarısız
  }
}
