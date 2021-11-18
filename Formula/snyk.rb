class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.764.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.764.0/snyk-macos"
    sha256 "2104c96a805c9ea6437ef561259efed7f5c93ee80a84572e29136e22458c7ea1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.764.0/snyk-linux"
    sha256 "6838e00c51c62884479b6eedbf27fa6a0572d838b1b9d59eba9ca93d2d6912a7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
