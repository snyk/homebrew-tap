class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.405.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.405.1/snyk-macos"
    sha256 "40b3400572edf69709826e0933b5f36dcdfdb63fdcdced78aede7ef932007b60"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.405.1/snyk-linux"
    sha256 "fb3fa647d97262c60a180f870f28130a7762e92fbba14f67466e847416cd303e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
