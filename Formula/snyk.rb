class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.454.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.454.0/snyk-macos"
    sha256 "b90ab6b7ba5501d8aae8d58e3934db2aad456f6921bed1dc203d747fc4211a86"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.454.0/snyk-linux"
    sha256 "ec99f3963424efbca54f346b0a828f87960e1f429d03335d2f74d9f3268c6580"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
