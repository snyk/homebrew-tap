class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.359.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.359.1/snyk-macos"
    sha256 "5452dd641a757e80687ce5354967ebd1c72c648eadbccd6a4137833464364cdb"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.359.1/snyk-linux"
    sha256 "5c204d336eb521a2689245b2f4c03feb99ad7480b750470f1c0d91d45c8c7853"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
