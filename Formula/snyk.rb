class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.680.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.680.0/snyk-macos"
    sha256 "b6c5016d1be5c96c797a4506b56c14fb3d17f042fea29495fc459d8d79bc5766"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.680.0/snyk-linux"
    sha256 "102ee5c8c652599dde6f61bfe37e3ac5d604b3a784610b43a62eddca78a7d8c4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
