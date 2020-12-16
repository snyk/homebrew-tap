class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.437.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.437.1/snyk-macos"
    sha256 "375ab9b018cafccc4a8f2408ee5d925f810925d1d128ef3aa96f1e0cc4d489e6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.437.1/snyk-linux"
    sha256 "9adae16ade09cfeb76ff01476250ab9d51e9db961c9b35373346b22709b090a7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
