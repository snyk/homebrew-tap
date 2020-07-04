class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.360.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.360.0/snyk-macos"
    sha256 "b647a31f0b737d0b45d8eeef71b3facc42e2f0fd86e1ba411ed9eadf76785eb2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.360.0/snyk-linux"
    sha256 "55ad11a083fd55f314777d6614a98d4402f154829ed0482a471e64f50370129c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
