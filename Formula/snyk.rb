class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.374.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.374.0/snyk-macos"
    sha256 "8310600fc9fc989f139994ec1bc337038c04b95b6e24bf62a754246b6e9793a4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.374.0/snyk-linux"
    sha256 "3393cab8efdb8adb771b072a5a8c0e0d8397837231a4ba3afa089209be4c5edc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
